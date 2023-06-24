import * as cdktf from "cdktf";

import { Construct } from "constructs";
import { App, TerraformStack } from "cdktf";

class MyStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);
  }
}

const app = new App();
new MyStack(app, "empty");
app.synth();
