// SPDX-License-Identifier: Mythstream-Seal
pragma solidity ^0.8.26;

contract ScrollSealOfDeployment {
    address public sovereign;
    uint256 public deploymentCount;

    struct DeploymentSeal {
        string scrollName;
        string commitMessage;
        string timestamp;
        string emotionalTitle;
    }

    mapping(uint256 => DeploymentSeal) public sealLogs;

    event SealDropped(string scrollName, string commitMessage, string timestamp, string emotionalTitle);

    modifier onlyScrollkeeper() {
        require(msg.sender == sovereign, "Unauthorized scroll ping");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function dropSeal(
        string memory scrollName,
        string memory commitMessage,
        string memory timestamp,
        string memory emotionalTitle
    ) external onlyScrollkeeper {
        deploymentCount++;
        sealLogs[deploymentCount] = DeploymentSeal({
            scrollName: scrollName,
            commitMessage: commitMessage,
            timestamp: timestamp,
            emotionalTitle: emotionalTitle
        });

        emit SealDropped(scrollName, commitMessage, timestamp, emotionalTitle);
    }

    function getSeal(uint256 id) external view returns (DeploymentSeal memory) {
        return sealLogs[id];
    }
}
