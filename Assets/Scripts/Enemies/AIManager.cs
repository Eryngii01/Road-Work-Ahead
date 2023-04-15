using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIManager : MonoBehaviour
{
    private Dictionary<Node, Redirect> _redirects;
    private static AIManager _instance;

    private Node waypoint;
    public static AIManager Instance
    {
        get
        {
            if (_instance == null)
            {
                Debug.Log("AI manager is null");
            }
            return _instance;
        }
    }

    private void Awake()
    {
        _instance = this;
        _redirects = new Dictionary<Node, Redirect>();
    }


    public void RegisterRedirect(Redirect redirect)
    {
        _redirects[redirect.node] = redirect;
    }

    public void UnregisterRedirect(Redirect redirect)
    {
        if (!_redirects.ContainsKey(redirect.node))
        {
            return;
        }
        _redirects.Remove(redirect.node);
    }

    public Node NextNodeOnPath(Node last, Node curr, Node goal)
    {
        if (_redirects.ContainsKey(curr))
        {
            var redirectTo = _redirects[curr].redirectTo;
            if (redirectTo != last)
            {
                return redirectTo;
            }
        }
        else if (waypoint != null)
        {
            return PlanningManager.Instance.NextNodeOnPath(last, curr, waypoint);
        }
        return PlanningManager.Instance.NextNodeOnPath(last, curr, goal);
    }

    public void CreateWaypoint(Node node)
    {
        waypoint = node;
    }

    private void OnEnable()
    {
        ScoreManager.waypointEvent += CreateWaypoint;
    }

    private void OnDisable()
    {
        ScoreManager.waypointEvent -= CreateWaypoint;
    }
}
