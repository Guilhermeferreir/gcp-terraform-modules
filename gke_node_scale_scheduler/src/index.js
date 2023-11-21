const buffer = require("safe-buffer").Buffer;
const container = require("@google-cloud/container");
const client = new container.v1.ClusterManagerClient();

exports.scaleGke = async (message, context) => {

  const payload = JSON.parse(buffer.from(message.data, "base64").toString());

  const request = {
    name: `projects/${payload.project_id}/locations/${payload.location}/clusters/${payload.cluster_id}`,
    nodePoolId: payload.node_pool_id,
    nodeCount:  payload.node_count,
  };

  const result = await client.setNodePoolSize(request);
  console.log(result[0]);

};