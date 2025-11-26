// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAllianceFlowGrid {
    string public batchID = "1321.9.135";
    string public steward = "Vinvin";

    address public admin;

    struct AllianceFlow {
        string alliance; // e.g. ASEAN, EU, BRICS
        uint256 reserves;
        uint256 swaps;
        uint256 timestamp;
    }

    AllianceFlow[] public flows;

    event FlowLogged(string alliance, uint256 reserves, uint256 swaps);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlow(string memory alliance, uint256 reserves, uint256 swaps) public onlyAdmin {
        flows.push(AllianceFlow(alliance, reserves, swaps, block.timestamp));
        emit FlowLogged(alliance, reserves, swaps);
    }

    function getFlow(uint256 index) public view returns (string memory alliance, uint256 reserves, uint256 swaps, uint256 timestamp) {
        AllianceFlow memory f = flows[index];
        return (f.alliance, f.reserves, f.swaps, f.timestamp);
    }
}
