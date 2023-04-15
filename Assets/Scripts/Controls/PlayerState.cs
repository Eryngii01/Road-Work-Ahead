using System;
using UnityEngine;

/*
Class used to declutter the Player class, encapsulating the player's behaviour in each state to
better reason about correctness and pinpoint bugs easily
*/
namespace Controls {
    public interface PlayerState {

        // Methods OnEnter and OnExit that can be extended for future purposes to encapsulate rendering, sound, and logic
        // that are associated with each state.
        public virtual void OnEnter() {}
        public virtual void OnExit() {}

        /// <summary>
        /// Returns the next node where the object will move towards next on the network.
        /// This callback is invoked when the game object reaches a node, which must be provided 
        /// with the next destination quickly since it is blocking. Note that you should
        /// generally return nodes that are adjacent to curr.
        /// </summary>
        /// <param name="player"> The Player script calling this state.</param>
        /// <param name="nextDest"> A method to calculate the next destination.</param>
        /// <param name="state"> The current state of the player.</param>
        /// <param name="redirectToPlace"> The redirect object that will be formed at the designated intersection.</param>
        /// <param name="last"> the node the Navable is coming from.</param>
        /// <param name="curr"> the node the Navable has reached.</param>
        abstract Node NextDestination(Player player, Func<Node, Node, Node> nextDest, PlayerState state, 
                                        Redirect redirectToPlace, Node last, Node curr);

        /// <summary>
        /// Adjust the player actions in response to the movement of the left joystick depending on the 
        /// current state of the player. 
        /// Driving: The player will move towards the direction of the joystick along 4 cardinal directions,
        /// where the speed is relative to the angle of the joystick. 
        /// RedirectingAtIntersection: Resets the swerve of the player.
        /// RedirectingOffIntersection: Acts similar to the Driving state, except that turning around will
        /// readjust the target intersection for redirection.
        /// </summary>
        /// <param name="player"> The Player script calling this state.</param>
        /// <param name="navigateOnNetwork"> The NavigateOnNetwork script specific to the player.</param>
        /// <param name="startRedirect"> A method to begin the redirecting process.</param>
        /// <param name="stopRedirect"> A method to exit the redirecting process.</param>
        /// <param name="directionInput"> The last direction input received from the player through the left joystick.</param>
        /// <param name="fromNode"> The node the player is coming from.</param>
        /// <param name="destination"> The node the player is going to.</param>
        /// <param name="joystickVector"> The 3D vector representing the 2D directional input translated to the player orientation.</param>
        /// <param name="playerOffset"> The offset of the player model from the road boundaries.</param>
        /// <param name="joystickAngle"> The angle representing the extent of how far the joystick is moved in a certain direction.</param>
        /// <param name="angleThreshold"> The angle of the joystick representing the current forward direction of the player.</param>
        /// <param name="baseSpeed"> The standard speed of the player gameobject.</param>
        abstract void Movement(Player player, NavigateOnNetwork navigateOnNetwork, Action startRedirect, Action stopRedirect, 
                            Vector2 directionInput, Node fromNode, Node destination, Vector3 joystickVector, Vector3 playerOffset, 
                            float joystickAngle, float angleThreshold, float baseSpeed);
    }
}
