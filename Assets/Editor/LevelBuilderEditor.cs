using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(LevelBuilder))]
[CanEditMultipleObjects]
public class LevelBuilderEditor : Editor
{
    SerializedProperty levelBuilder;

    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        LevelBuilder myScript = (LevelBuilder)target;
        if (GUILayout.Button("Build Segments"))
        {
            myScript.LoadLevel();
        }

        if (GUILayout.Button("Clear Map"))
        {
            myScript.ClearMap();
        }

        if (GUILayout.Button("Fill Empty"))
        {
            myScript.FillInEmptySegments();
        }
    }
}