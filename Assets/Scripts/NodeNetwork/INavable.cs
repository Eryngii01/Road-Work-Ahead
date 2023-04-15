using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface INavable
{
    /// <summary>
    /// Returns the next node where the object will move towards next on the network.
    /// This callback is invoked when the game object reaches a node, which must be provided 
    /// with the next destination quickly since it is blocking. Note that you should
    /// generally return nodes that are adjacent to curr.
    /// </summary>
    /// <param name="last"> the node the Navable is coming from.</param>
    /// <param name="curr"> the node the Navable has reached.</param>
    public Node NextDestination(Node last, Node curr);
}
