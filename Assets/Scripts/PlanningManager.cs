using System.Collections.Generic;
using Planning;
using System;
using UnityEngine;


public class PlanningManager : MonoBehaviour
{
    /// Implementation of AStar specific to the current node network setup.
    /// A state is a tuple of the node and the previous node, 
    /// actions are the next node you can visit, goals are simply nodes.
    class NodeNetworkAStar : AStar<(Node, Node), Node, Node> {
        /// Give a lower bound on the cost of getting from state_a to state_b
        protected override double Heuristic((Node, Node) state, Node goal)
        {
            var (_, curr) = state;
            return Vector3.Distance(curr.transform.position, goal.transform.position);
        }

        /// Return the next state and the cost of this transition
        protected override ((Node, Node), double) Transition((Node, Node) state, Node next)
        {
            var (_, curr) = state;
            return (
                (curr, next), 
                (curr.transform.position - next.transform.position).magnitude
            );
        }

        /// Return the actions availble at this state
        protected override IReadOnlyCollection<Node> AvailbleActions((Node, Node) state)
        {
            var (last, curr) = state;
            return curr.AdjacentComingFrom(last);
        }

        protected override bool InGoal((Node, Node) state, Node goal)
        {
            var (_, curr) = state;
            return curr.Equals(goal);
        }
    }

    /// Maps a current node and destination node to a direction of travel
    private Dictionary<((Node, Node), Node), Node> navigationCache;

    /// AStar instance
    private NodeNetworkAStar aStar;

    /// Singleton stuff
    private static PlanningManager _instance;

    public static PlanningManager Instance
    {
        get
        {
            if (_instance == null)
            {
                Debug.Log("Planning manager is null");
            }
            return _instance;
        }
    }

    private void Awake()
    {
        _instance = this;
        aStar = new NodeNetworkAStar();
        navigationCache = new Dictionary<((Node, Node), Node), Node>();
    }

    public Node NextNodeOnPath(Node last, Node curr, Node goal) {
        if (curr == goal) {
            return goal;
        }

        var startState = (last, curr);
        if (!navigationCache.ContainsKey((startState, goal))) {
            // Yikes we have a cache miss!
            // Use AStar to form a plan and populate the cache so we don't have
            // another miss.
            var plan = aStar.Plan(startState, goal);
            if (plan is null) {
                Debug.Log("Planner cannot find path! Check network topology!");
                return null;
            }
            Debug.Assert(plan.Count > 0);
            Debug.Log("Path start");
            foreach (var (state, nextNode, _) in plan) {
                navigationCache[(state, goal)] = nextNode;
            }
        }
        Debug.Assert(navigationCache.ContainsKey((startState, goal)), curr);
        return navigationCache[(startState, goal)];
    }
}
