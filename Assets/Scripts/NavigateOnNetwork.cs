using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
///  This class allows a game object to navigate on the road network in the game.
/// </summary>
[RequireComponent(typeof(INavable))]
public class NavigateOnNetwork : MonoBehaviour
{
    [Header("The node at which the game object will start")]
    public Node spawn;

    [Header("The initial node the game object will go to")]
    public Node initialDestination = null;

    [Header("Speed in units per second")]
    public float speed = 1.0f;

    [Header("Initial interpolation value between 0 and 1"), Range(0f, 1f)]
    public float initialT = 0.0f;

    private INavable navable;
    bool _onCreate = true;

    public Node from { get; private set; }

    public Node to { get; private set; }

    public float t { get; private set; }

    // Distance between nodes
    private float _distance;

    public float speedMultiplier { get; set; } = 1f;

    // Interpolation parameter ranges from 0 to 1.
    void Start()
    {
        Debug.Assert(spawn != null, "Spawn must be set", gameObject);
        navable = GetComponent<INavable>();
        
        Reset();
        _onCreate = false;
    }

    void Reset() {
        from = spawn;
        to = initialDestination ?? spawn;
        _distance = Vector3.Distance(from.transform.position, to.transform.position);
        t = initialT;
    }

    private void ResetMultiplier()
    {
        speedMultiplier = 1.0f;
    }

    private void UpdateSpeedMultiplier(float multiplier)
    {
        speedMultiplier = multiplier;
    }
    public void TurnAround()
    {
        Node temp = from;
        from = to;
        to = temp;
        t = 1 - t;
    }

    void Update()
    {
        if (t >= 1 || from == to)
        {
            Node oldTo = to;
            to = navable.NextDestination(from, to);
            Debug.Assert(to != null, "Destination must not be null.");

            // If 'to' yields null, then revert 'from' to its previous value and return to try again
            if (to)
            {
                from = oldTo;
                t = 0;
                _distance = Vector3.Distance(from.transform.position, to.transform.position);
            }
            else
            {
                to = oldTo;
                return;
            }
        }

        // Don't move if from equals to.
        if (from == to)
        {
            return;
        }

        transform.position = from.transform.position * (1 - t) + to.transform.position * t;
        transform.LookAt(to.transform, Vector3.up);
        t += (speed * speedMultiplier) / _distance * Time.deltaTime;
    }

    private void OnEnable()
    {
        ScoreManager.setSpeedMultiplierEvent += UpdateSpeedMultiplier;
        ScoreManager.resetSpeedMultiplierEvent += ResetMultiplier;

        // When object pooling, reset this object when it is enabled
        if (!_onCreate) {
            Reset();
        }
    }

    private void OnDisable()
    {
        ScoreManager.setSpeedMultiplierEvent -= UpdateSpeedMultiplier;
        ScoreManager.resetSpeedMultiplierEvent -= ResetMultiplier;

        // If pooled object has been returned while slowed, reset the effect
        ResetMultiplier();
    }
}
