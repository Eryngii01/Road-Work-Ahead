using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System;

[ExecuteInEditMode, RequireComponent(typeof(Node))]
public class NodeEditor : MonoBehaviour
{
    /// NodeEditor is a helper for building large node networks. Each child of this node will now be 
    /// considered a potential destination. At start the script will add an edge to any node in 
    /// the vicinity of one of its destination. In the editor this is visualized as follows.
    /// yellow lines represent an unconnected destination blue lines represent a destination
    /// that has formed an edge to another node.

    private List<Transform> destinations = new List<Transform>();
    private Dictionary<Transform, Node> connected = new Dictionary<Transform, Node>();

    public float connectionRadius = 1f;
    private Node node;

    // Start is called before the first frame update
    void Awake()
    {
        node = GetComponent<Node>();
        foreach (Transform child in transform) {
            destinations.Add(child);
        }
        ConnectNodes();
    }

    // Update is called once per frame
    void Update()
    {
        if(!Application.isPlaying) {
            ConnectNodes();
        }
    }

    void ConnectNodes() {
        connected.Clear();
        var nodes = FindObjectsOfType<Node>();
        foreach(var dest in destinations)
        {
            foreach (var other in nodes) 
            {
                if (other == node) {
                    continue;
                }
                var nodePos = other.transform.position;
                var destPos = dest.position;
                if (Vector3.Distance(nodePos, destPos) < connectionRadius) {
                    node.SetEdgeTo(other);
                    connected[dest] = other;
                }
            }

            if (!connected.ContainsKey(dest)) {
                node.UnsetEdgeTo(node);
            }
        }
    }

    void OnDrawGizmos() 
    {
        if(Application.isPlaying) {
            return;
        }

        foreach (var dest in destinations) {
            
            Vector3 positionStart = transform.position;
            Vector3 positionEnd;
            Color color;

            if (connected.ContainsKey(dest)) 
            {
                color = Color.blue;
                positionEnd = connected[dest].transform.position;
            } else {
                color = Color.yellow;
                positionEnd = dest.transform.position;
            }
            Gizmos.color = color;
            Gizmos.DrawLine(
                positionStart,
                positionEnd
            );
        }
    }
}
