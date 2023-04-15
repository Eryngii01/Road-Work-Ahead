using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Celltower : Item
{
    public GameObject timer = null;
    public GameObject timerPrefab = null;
    public int durationTimer = 10;
    private void Awake()
    {
        gameObject.tag = "Item";
    }

    public override void Deploy(Node node)
    {
        transform.localScale = new Vector3(1, 1, 1);
        transform.localRotation = Quaternion.identity;
        gameObject.SetActive(true);
        transform.position = node.transform.position;
        transform.rotation = node.transform.rotation;
        holder = null;
        dropped = true;
        timer = Instantiate(timerPrefab, transform.position + new Vector3(0, 7, 0), Quaternion.identity);
        timer.transform.SetParent(transform);
        StartCoroutine(CreateWaypoint(node));
        StartCoroutine(DestroyTimer());
    }

    private IEnumerator DestroyTimer()
    {
        for (int i = 0; i < durationTimer; i++)
        {
            timer.GetComponent<TextMesh>().text = (durationTimer - i).ToString();
            yield return new WaitForSeconds(1);
        }
        Destroy(gameObject);
    }

    IEnumerator CreateWaypoint(Node node)
    {
        ScoreManager.Instance.CreateWaypoint(node);
        yield return new WaitForSecondsRealtime(10);
        Destroy(gameObject);
    }

    public override void preDropAnimation()
    {
        // Minimize and spin the item
        transform.localScale = new Vector3(0.6f, 0.6f, 0.6f);
        transform.Rotate(new Vector3(0, 1, 0), 0.5f);
    }

    public override void InteractWithEnemy(GameObject enemy)
    {
        return;
    }

    private void OnDestroy()
    {
        if (holder != null)
        {
            holder = null;
        }
        ScoreManager.Instance.CreateWaypoint(null);
    }
}
