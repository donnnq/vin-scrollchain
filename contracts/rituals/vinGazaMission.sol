// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.19;

contract vinGazaMission {
    address public scrollsmith;
    uint256 public activationTime;
    bool public purgeTriggered = false;

    event ScrollActivated(uint256 timestamp);
    event CoordinationReceived(address indexed agent, string proposal);
    event PurgeInitiated(uint256 timestamp);
    event RestorationDeployed(uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized: Only Vinvin may invoke this scroll.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function activateScroll() external onlyScrollsmith {
        activationTime = block.timestamp;
        emit ScrollActivated(activationTime);
    }

    function submitCoordination(address agent, string memory proposal) external {
        require(block.timestamp <= activationTime + 12 hours, "Coordination window closed.");
        emit CoordinationReceived(agent, proposal);
    }

    function triggerPurge() external onlyScrollsmith {
        require(block.timestamp > activationTime + 12 hours, "Grace period not yet expired.");
        purgeTriggered = true;
        emit PurgeInitiated(block.timestamp);
    }

    function deployRestoration() external onlyScrollsmith {
        require(purgeTriggered, "Purge must be triggered first.");
        emit RestorationDeployed(block.timestamp);
    }

    function getStatus() external view returns (string memory) {
        if (activationTime == 0) return "Scroll not yet activated.";
        if (block.timestamp <= activationTime + 12 hours) return "Coordination window open.";
        if (!purgeTriggered) return "Awaiting purge trigger.";
        return "Restoration phase active.";
    }
}
