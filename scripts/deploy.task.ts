import { task, types } from "hardhat/config";
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { deploy, sendEvent} from "./lib";
import fs from "fs";

task("deploy", "deploy submission")
    .addParam("problemName", "Problem name")
    .setAction(async (taskArgs: any, hre: HardhatRuntimeEnvironment) => {
        try {
            const {problemName} = taskArgs;
            const metadata = JSON.parse(fs.readFileSync("scripts/metadata.json", 'utf8'));
            const problem_id = String(metadata[problemName]);
            await sendEvent('deploySolutionStart', [{
                key: 'problem_id',
                value: problem_id
            }]);
            const tx_json = await deploy(problemName, hre);
            const tx = tx_json.hash;
            const address = tx_json.address[0];
            console.log(
                `${problemName} contract deployed on zk network.\n` +
                `Problem Name: ${problemName}\n` +
                `Problem ID: ${problem_id}\n` +
                `Contract Address: ${address}\n` +
                `Transaction Hash: ${tx}`
            );
            
            await sendEvent('deploySolutionSucceed', [{
                key: 'problem_id',
                value: problem_id
            }, 
            {
                key: 'contract_address',
                value: address
            }, 
            {
                key: 'transaction_hash',
                value: tx
            }]);
        }
        catch (e) {
            console.error("Failed to deploy contract", e);
            await sendEvent('deploySolutionFail', [{
                key: 'error',
                value: e
            }
        ]);
        }
    });

