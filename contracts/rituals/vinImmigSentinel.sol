// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinImmigSentinel {
    struct Record {
        string name;
        string passportID;
        string nationality;
        bool visaValid;
        bool flaggedForViolation;
        string reason;
        bool detained;
        uint256 timestamp;
    }

    mapping(address => Record) public records;

    event ViolationLogged(address indexed person, string reason, uint256 timestamp);
    event DetentionOrder(address indexed person, string reason);
    event Cleared(address indexed person);
    event VisaUpdated(address indexed person, bool valid);

    function logViolation(
        address _person,
        string memory _name,
        string memory _passportID,
        string memory _nationality,
        bool _visaValid,
        string memory _reason
    ) public {
        records[_person] = Record({
            name: _name,
            passportID: _passportID,
            nationality: _nationality,
            visaValid: _visaValid,
            flaggedForViolation: true,
            reason: _reason,
            detained: false,
            timestamp: block.timestamp
        });
        emit ViolationLogged(_person, _reason, block.timestamp);
    }

    function issueDetention(address _person) public {
        require(records[_person].flaggedForViolation, "No violation recorded.");
        require(!records[_person].visaValid, "Subject has valid visa.");
        records[_person].detained = true;
        emit DetentionOrder(_person, records[_person].reason);
    }

    function clearRecord(address _person) public {
        records[_person].detained = false;
        records[_person].flaggedForViolation = false;
        emit Cleared(_person);
    }

    function updateVisaStatus(address _person, bool _valid) public {
        records[_person].visaValid = _valid;
        emit VisaUpdated(_person, _valid);
    }

    function getStatus(address _person) public view returns (string memory) {
        Record memory r = records[_person];
        if (r.detained) return "Detained";
        if (r.flaggedForViolation) return "Flagged for Violation";
        if (r.visaValid) return "Compliant";
        return "Unverified";
    }
}
