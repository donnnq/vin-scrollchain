// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRitualGuardian {
    address public scrollOverseer;

    struct LGURecord {
        string barangay;
        bool respondedToFOI;
        bool fulfilledDAOProposal;
        uint256 lastAudit;
        string ritualStatus; // e.g., "Blessed", "Flagged", "Pending"
    }

    mapping(string => LGURecord) public registry;
    string[] public barangayList;

    event RitualVerified(string barangay, string status, uint256 timestamp);
    event RitualFlagged(string barangay, string reason, uint256 timestamp);

    constructor() {
        scrollOverseer = msg.sender;
    }

    function verifyRitual(string memory barangay, bool responded, bool fulfilled) external {
        require(msg.sender == scrollOverseer, "Only overseer can verify rituals");

        string memory status = (responded && fulfilled) ? "Blessed" : "Flagged";
        LGURecord memory record = LGURecord({
            barangay: barangay,
            respondedToFOI: responded,
            fulfilledDAOProposal: fulfilled,
            lastAudit: block.timestamp,
            ritualStatus: status
        });

        registry[barangay] = record;
        barangayList.push(barangay);

        emit RitualVerified(barangay, status, block.timestamp);
    }

    function flagRitual(string memory barangay, string memory reason) external {
        require(msg.sender == scrollOverseer, "Only overseer can flag rituals");

        registry[barangay].ritualStatus = "Flagged";
        emit RitualFlagged(barangay, reason, block.timestamp);
    }

    function getRecord(string memory barangay) external view returns (LGURecord memory) {
        return registry[barangay];
    }

    function totalRegistered() external view returns (uint256) {
        return barangayList.length;
    }
}
