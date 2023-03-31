const { Configuration, OpenAIApi } = require("openai");
const maxApi = require("max-api");
const Bottleneck = require("bottleneck");
require("dotenv").config();

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY
});

const openai = new OpenAIApi(configuration);

const limiter = new Bottleneck({
  maxConcurrent: 1,
  minTime: 500 // set a minimum delay of 500ms between requests
});

async function runCompletion(prompt) {
  try {
    const completion = await limiter.schedule(() =>
      openai.createCompletion({
        model: "text-davinci-003", // which model do we use
        prompt: prompt,
        max_tokens: 100 // how tokens in one response (completion)?
      })
    );
// some error code creation
    maxApi.outlet(completion.data.choices[0].text);
  } catch (error) {
    console.error(error);
    maxApi.post(error.response.data);
  }
}
// the output from the node.script object in Max
maxApi.addHandler("message", (output) => {
  runCompletion(output);
});
