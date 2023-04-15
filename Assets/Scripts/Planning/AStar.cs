using System.Collections.ObjectModel;
using System.Collections.Generic;
using System;

namespace Planning {
    public abstract class AStar<S, A, G>
    {
        /// A container class for transitions we have already searched
        private class Path : IComparable<Path> {
            /// The the second to last state in the path
            S prevState;
            /// The action we took to transition from the prevState to the state
            A action;
            /// The final state in the path
            public S state;
            /// Cost of this path
            public double costSoFar;
            /// The current optimistic estimate of the cost to reach the goal
            /// from this transition
            double hubristicToGoal;
            /// The current optimistic estimate of the total to take this path
            /// and then reach the goal.
            double fValue {
                get {
                    return costSoFar + hubristicToGoal;
                }
            }
            /// Previous transition that lead here
            Path prev;

            public Path(
                    Path prev, 
                    S prevState,
                    A action,
                    S state,
                    double costSoFar,
                    double hubristicToGoal) {
                this.prev = prev;
                this.prevState = prevState;
                this.action = action;
                this.state = state;
                this.costSoFar = costSoFar;
                this.hubristicToGoal = hubristicToGoal;
            }

            public int CompareTo(Path otherTransition) {
                if (otherTransition == null) return 1;
                return this.fValue.CompareTo(otherTransition.fValue);
            }

            /// Returns the path from the start state to the goal
            public List<(S, A, S)> getPathFromStart() {
                List<(S, A, S)> path = new List<(S, A, S)>();
                Path curr = this;
                while (curr != null) {
                    path.Add((curr.prevState, curr.action, curr.state));
                    curr = curr.prev;
                }
                path.Reverse();
                return path;
            }
        }

        // Frontier of unexpanded notes.
        private IPriorityQueue<Path> frontier;
        // Maps from state to lowest cost so far to reach said state.
        private Dictionary<S, double> reached;

        public AStar () {
            frontier = new MinHeap<Path>();
            reached = new Dictionary<S, double>();
        }

        // Will either return a plan to reach the goal state or 
        // if it is impossible it will return null.
        public List<(S, A, S)> Plan(S start, G goal) {
            reached.Clear();
            frontier.Clear();
            Path seenTransition = null;
            double costSoFar = 0;
            S state = start;
            S nextState;
            double costOfTrans;
            
            while (true) {
                // Check if we are about to expand the goal
                if (InGoal(state, goal)) {
                    // If so we have found the shortest path.
                    if (seenTransition != null) {
                        var path =  seenTransition.getPathFromStart();
                        return path;
                    } else {
                        return new List<(S, A, S)>();
                    }
                }

                // Expand state
                foreach (A action in AvailbleActions(state)) {
                    (nextState, costOfTrans) = Transition(state, action);
                    double heuristicToGoal = Heuristic(nextState, goal);
                    double costToReachNextState = costSoFar + costOfTrans;
                    double fValue = costSoFar + costOfTrans;
                    if (!reached.ContainsKey(nextState) 
                        || costToReachNextState < reached[nextState]
                    ) {
                        frontier.Insert(
                            new Path(
                                seenTransition,
                                state,
                                action,
                                nextState,
                                costToReachNextState,
                                heuristicToGoal
                            )
                        );
                        reached[nextState] = costToReachNextState;
                    }
                }

                // There is no path from the current state to the goal state.
                if (frontier.IsEmpty()) {
                    return null;
                }

                // Get next state to expand
                seenTransition = frontier.Pop();
                state = seenTransition.state;
                costSoFar = seenTransition.costSoFar;
            }
        }


        /// Return the next state and the cost of this transition
        protected abstract (S, double) Transition(S state, A action);

        /// Return the actions availble at this state
        protected abstract IReadOnlyCollection<A> AvailbleActions(S state);

        /// Give a lower bound on the cost of getting from state_a to the goal
        protected abstract double Heuristic(S state, G goal);

        /// Return if a state is a goal state
        protected abstract bool InGoal(S state, G goal);
    }
}