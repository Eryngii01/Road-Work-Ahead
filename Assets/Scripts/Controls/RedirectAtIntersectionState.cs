using System;
using UnityEngine;

namespace Controls {
    public class RedirectAtIntersectionState : Controls.PlayerState {
        public Node NextDestination(Player player, Func<Node, Node, Node> nextDest, PlayerState state, Redirect redirectToPlace, Node last, Node curr) {
            return curr;
        }

        public void Movement(Player player, NavigateOnNetwork navigateOnNetwork, Action startRedirect, Action stopRedirect, 
                            Vector2 directionInput, Node fromNode, Node destination, Vector3 joystickVector, Vector3 playerOffset, 
                            float joystickAngle, float angleThreshold, float baseSpeed) {
            player.playerModel.transform.localPosition = playerOffset;
        }
    }
}
