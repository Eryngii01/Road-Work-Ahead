using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Hourglass : Item
{
    public GameObject timer = null;
    public GameObject timerPrefab = null;
    public int durationTimer = 10;
    public float modifier = 0.1f;
    private void Awake()
    {
        gameObject.tag = "Item";
    }

    private void Update()
    {
        if (timer != null)
        {
            transform.position = holder.transform.position + new Vector3(0, 6, 0);
            timer.transform.position = holder.transform.position + new Vector3(0, 10, 0);
        }
        if (!dropped && holder == null)
        {
            preDropAnimation();
        }
    }
    public override void Deploy(Node node)
    {
        gameObject.SetActive(true);
        StartCoroutine(FreezeTime());
        dropped = true;
        timer = Instantiate(timerPrefab, transform.position + new Vector3(0, 1, 0), Quaternion.identity);
        timer.transform.SetParent(transform);
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

    IEnumerator FreezeTime()
    {
        ScoreManager.Instance.SetSpeedMultiplier(modifier);
        //restore speed for holder
        bool isSuperPlayer = holder.GetComponent<Controls.Player>().isSuperPlayer;
        if (isSuperPlayer)
        {
            holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1.5f;
        }
        else
        {
            holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1f;
        }
        yield return new WaitForSecondsRealtime(10);
        Destroy(gameObject);
    }

    public override void preDropAnimation()
    {
        // Minimize and spin the item
        transform.localScale = new Vector3(0.7f, 0.7f, 0.7f);
        transform.Rotate(new Vector3(0, 1, 0), 0.5f);
    }

    public override void InteractWithEnemy(GameObject enemy)
    {
        return;
    }

    private void OnDestroy()
    {
        ScoreManager.Instance.ResetSpeedMultiplier();
        if (holder != null)
        {
            bool isSuperPlayer = holder.GetComponent<Controls.Player>().isSuperPlayer;
            if (isSuperPlayer)
            {
                holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1.5f;
            }
            else
            {
                holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1f;
            }
            holder = null;
        }
    }
}
