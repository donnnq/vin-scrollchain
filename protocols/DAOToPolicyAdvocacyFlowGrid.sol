// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPolicyAdvocacyFlowGrid {
    string public batchID = "HIV-Resilience-001";
    string public steward = "Vinvin";

    address public admin;

    struct AdvocacyFlow {
        string initiative;   // global solidarity, donor push
        string region;       // Philippines, international
        uint256 timestamp;
    }

    AdvocacyFlow[] public flows;

    event AdvocacyLogged(string initiative, string region);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdvocacy(string memory initiative, string memory region) public onlyAdmin {
        flows.push(AdvocacyFlow(initiative, region, block.timestamp));
        emit AdvocacyLogged(initiative, region);
    }

    function getAdvocacy(uint256 index) public view returns (string memory initiative, string memory region, uint256 timestamp) {
        AdvocacyFlow memory a = flows[index];
        return (a.initiative, a.region, a.timestamp);
    }
}
