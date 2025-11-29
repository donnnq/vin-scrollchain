// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAdaptationLedger {
    string public batchID = "1321.9.178";
    string public steward = "Vinvin";

    address public admin;

    struct Adaptation {
        string sector;      // energy, transport, digital
        string measure;     // new policy, upgraded infra, resilience training
        uint256 timestamp;
    }

    Adaptation[] public adaptations;

    event AdaptationLogged(string sector, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdaptation(string memory sector, string memory measure) public onlyAdmin {
        adaptations.push(Adaptation(sector, measure, block.timestamp));
        emit AdaptationLogged(sector, measure);
    }

    function getAdaptation(uint256 index) public view returns (string memory sector, string memory measure, uint256 timestamp) {
        Adaptation memory a = adaptations[index];
        return (a.sector, a.measure, a.timestamp);
    }
}
