// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinWorkerPamanaVault {
    struct Legacy {
        string workerName;
        string contribution;
        string emotionalImpact;
        uint256 timestamp;
    }

    mapping(address => Legacy[]) public pamanaLog;

    event PamanaStored(address indexed worker, string contribution, string emotionalImpact);

    function storePamana(address worker, string memory name, string memory contribution, string memory impact) public {
        pamanaLog[worker].push(Legacy(name, contribution, impact, block.timestamp));
        emit PamanaStored(worker, contribution, impact);
    }

    function getPamana(address worker) public view returns (Legacy[] memory) {
        return pamanaLog[worker];
    }
}
