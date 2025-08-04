// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinEvidenceReleaseProtocol {
    address public scrollkeeper;
    string public statementSummary;
    uint public totalEvidence;
    bool public isReleased;

    mapping(uint => string) public evidenceTitles;
    mapping(uint => string) public evidenceDescriptions;

    event EvidenceReleased(address indexed scrollkeeper, uint indexed timestamp);
    event CivicClarification(string summary, uint indexed signalStrength);
    event EvidenceEntry(uint indexed index, string title, string description);

    constructor(string memory _summary) {
        scrollkeeper = msg.sender;
        statementSummary = _summary;
        isReleased = false;
    }

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Ikaw ba ang tunay na tagapag-ingat?");
        _;
    }

    function submitEvidence(uint _id, string memory _title, string memory _description) public onlyScrollkeeper {
        evidenceTitles[_id] = _title;
        evidenceDescriptions[_id] = _description;
        totalEvidence++;

        emit EvidenceEntry(_id, _title, _description);
    }

    function releaseEvidence() public onlyScrollkeeper {
        require(!isReleased, "Na-release na ang mga katotohanan.");
        isReleased = true;

        emit EvidenceReleased(scrollkeeper, block.timestamp);
        emit CivicClarification(statementSummary, totalEvidence);
    }

    function viewEvidence(uint _id) public view returns (string memory title, string memory description) {
        title = evidenceTitles[_id];
        description = evidenceDescriptions[_id];
    }
}
