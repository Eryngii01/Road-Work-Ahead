using System;
using UnityEngine;

namespace Controls {
    public class RedirectApproachingIntersectionState : Controls.PlayerState {
        public Node NextDestination(Player player, Func<Node, Node, Node> nextDest, PlayerState state, 
                                    Redirect redirectToPlace, Node last, Node curr) {
            if (curr == redirectToPlace.node) {
                redirectToPlace.StartForming();
                state = this;
                return curr;
            }

            return nextDest(last, curr);
        }

        public void Movement(Player player, NavigateOnNetwork navigateOnNetwork, Action startRedirect, Action stopRedirect, 
                            Vector2 directionInput, Node fromNode, Node destination, Vector3 joystickVector, Vector3 playerOffset, 
                            float joystickAngle, float angleThreshold, float baseSpeed) {
            if (joystickAngle < angleThreshold) {
                player.playerModel.transform.localPosition = (playerOffset + player.swerveSize 
                                                            * player.transform.InverseTransformVector(joystickVector));
                navigateOnNetwork.speed = baseSpeed * joystickVector.magnitude;
            } else {
                player.playerModel.transform.localPosition = -(playerOffset + player.swerveSize 
                                                            * player.transform.InverseTransformVector(joystickVector));
                navigateOnNetwork.TurnAround();
                startRedirect();
                stopRedirect();
            }
        }
    }
}
