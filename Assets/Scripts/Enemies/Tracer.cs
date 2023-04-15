using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(NavigateOnNetwork), typeof(Rigidbody))]
public class Tracer : Pool, INavable
{
    [Header("This tracers goal")]
    public Node goal;
    
    [Header("Interval to spawn tracers at")]
    public float interval = 0.5f;
    
    [Header("Period of time in which tracer will not collide with enemies")]
    public float invincibleTime = 0.1f;
    public float maxLifetime = 15f;
    public TrailRenderer trailRenderer;

    
    public NavigateOnNetwork navigateOnNetwork {get; private set;}
    public Rigidbody rb {get; private set;}

    private HashSet<Node> seen;

    void Awake() {
        navigateOnNetwork = GetComponent<NavigateOnNetwork>();
        rb = GetComponent<Rigidbody>();
        seen = new HashSet<Node>();
    }

    void Start() {
        trailRenderer.enabled = true;
        trailRenderer.time = interval;
        // trailRenderer.time = interval / 1.5f;
        StartCoroutine(Timeout());
        StartCoroutine(Invincible());
    }

    public Node NextDestination(Node last, Node curr) {
        if (curr == goal || seen.Contains(curr)) {
            StartCoroutine(Terminate());
        }
        seen.Add(curr);
        return AIManager.Instance.NextNodeOnPath(last, curr, goal);
    }

    private IEnumerator Invincible() 
    {
        rb.detectCollisions = false;
        yield return new WaitForSeconds(interval);
        rb.detectCollisions = true;
    }

    private IEnumerator Terminate() {
        
        navigateOnNetwork.enabled = false;
        rb.detectCollisions = false;
        yield return new WaitForSeconds(interval);

        trailRenderer.Clear();

        // Reset bookkeeping on traversed nodes
        seen.Clear();
        
        ReturnToPool();
    }

    private IEnumerator Timeout() {
        yield return new WaitForSeconds(maxLifetime);
        yield return Terminate();
    }

    void OnTriggerEnter(Collider collision) {
        GameObject other = collision.gameObject;
        Enemy enemy = other.GetComponent<Enemy>();
        if(other.tag == "Enemy" && enemy?.dead == false && enemy?.goal == goal) {
            StartCoroutine(Terminate());
        }
    }

    void OnEnable() {
        // When object pooling, reset this object when it is enabled
        Start();
    }
}
