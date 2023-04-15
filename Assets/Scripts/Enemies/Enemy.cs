using System.Collections;
using System.Collections.Generic;
using UnityEngine;



[RequireComponent(typeof(AudioSource), typeof(NavigateOnNetwork), typeof(Rigidbody))]
public class Enemy : Pool, INavable
{
    [Header("Where this enemy is Navigating to")]
    public Node goal;

    [Header("Required Resources")]
    public AudioClip crashSound;
    public Tracer tracerPrefab;
    public GameObject explosionPrefab;

    // Properties
    public bool dead { get; private set; }
    public bool isTutorial = false;

    // Required Components
    private AudioSource _audioSource;
    private Rigidbody _rigidbody;
    private NavigateOnNetwork _navigateOnNetwork;

    // -------------- Object Pooling ---------------
    private TracerPool _tracerPool;
    // ---------------------------------------------


    void Awake()
    {
        _audioSource = GetComponent<AudioSource>();
        _rigidbody = GetComponent<Rigidbody>();
        _navigateOnNetwork = GetComponent<NavigateOnNetwork>();
    }

    void Start() {
        _tracerPool = GameObject.FindObjectOfType<TracerPool>();

        dead = false;
        InvokeRepeating("SpawnTracer", 0f, tracerPrefab.interval);
    }

    void SpawnTracer()
    {
        if (dead)
        {
            return;
        }

        _tracerPool.SetMarkers(_navigateOnNetwork.from, goal, _navigateOnNetwork.to, _navigateOnNetwork.speedMultiplier);
        GameObject tracer = _tracerPool.Pool.Get();
    }
    public Node NextDestination(Node last, Node curr)
    {
        return AIManager.Instance.NextNodeOnPath(last, curr, goal);
    }

    public enum DeathType
    {
        Fly,
        Explode,
        SpinOut,
    }

    public void Die(DeathType deathType)
    {
        dead = true;
        _audioSource.PlayOneShot(crashSound);
        _navigateOnNetwork.enabled = false;
        switch (deathType)
        {
            case DeathType.Fly:
                StartCoroutine(FlyCoroutine());
                break;
            case DeathType.Explode:
                StartCoroutine(ExplodeCoroutine());
                break;
            case DeathType.SpinOut:
                StartCoroutine(SpinOutCoroutine());
                break;
        }
    }

    private IEnumerator FlyCoroutine()
    {
        Vector3 rocket = new Vector3(5, 20, 5);
        _rigidbody.AddForce(rocket, ForceMode.Impulse);

        yield return new WaitForSeconds(5f);
        ReturnToPool();
    }

    private IEnumerator ExplodeCoroutine()
    {
        GameObject explosion = Instantiate(explosionPrefab, gameObject.transform.position, gameObject.transform.rotation) as GameObject;

        yield return new WaitForSeconds(1f);
        Destroy(explosion);
        ReturnToPool();
    }

    private IEnumerator SpinOutCoroutine()
    {
        Vector3 force = new Vector3(0, -25, 0);
        float back_x = Random.Range(5f, 10f) * (1 + -2 * Random.Range(0, 2));
        Vector3 back = new Vector3(back_x, 0, -10);
        _rigidbody.maxAngularVelocity = Mathf.Infinity;
        _rigidbody.AddTorque(force, ForceMode.Impulse);
        _rigidbody.AddRelativeForce(back, ForceMode.Impulse);

        yield return new WaitForSeconds(5f);
        ReturnToPool();
    }

    void OnTriggerEnter(Collider collision)
    {
        if (dead)
        {
            return;
        }

        if (collision.gameObject.tag == "StreetCar" || collision.gameObject.tag == "Enemy")
        {
            RandomDeath();
        }
        else if (collision.gameObject == goal.gameObject)
        {
            ReturnToPool();
            ScoreManager.Instance.LoseEnemy();
        }

        else if (collision.gameObject.tag == "Item" && !dead && collision.gameObject.GetComponent<Item>().dropped)
        {
            collision.gameObject.GetComponent<Item>().InteractWithEnemy(gameObject);
        }
        else if (collision.gameObject.tag == "Player" && !isTutorial)
        {
            if (!collision.gameObject.GetComponent<Controls.Player>().isSuperPlayer)
            {
                int currLife = collision.gameObject.GetComponent<Controls.Player>().lifeCount;
                ScoreManager.Instance.UpdatePlayerLife(currLife - 1);
            }

            RandomDeath();
        }
    }

    public void RandomDeath()
    {
        int random = Random.Range(1, 4);
        if (random == 1)
        {
            Die(DeathType.Explode);
        }
        else if (random == 2)
        {
            Die(DeathType.SpinOut);
        }
        else
        {
            Die(DeathType.Fly);
        }

        // Update the score and wave progress
        ScoreManager.Instance.TriggerScore();
    }

    void ResumePlayerCollision()
    {
        isTutorial = false;
    }

    void OnEnable()
    {
        ScoreManager.tutorialLivesEvent += ResumePlayerCollision;

        // When object pooling, reset this object when it is enabled
        Start();
    }

    void OnDisable()
    {
        ScoreManager.tutorialLivesEvent -= ResumePlayerCollision;
    }
}
