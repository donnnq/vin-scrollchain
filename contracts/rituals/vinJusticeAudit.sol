contract vinJusticeAudit {
    struct Record {
        string reason;
        uint256 timestamp;
        bool released;
    }

    mapping(address => Record) public custodyRecords;

    event RecordLogged(address indexed subject, string reason, uint256 timestamp);
    event SubjectReleased(address indexed subject);

    function logCustody(address subject, string memory reason) public {
        custodyRecords[subject] = Record(reason, block.timestamp, false);
        emit RecordLogged(subject, reason, block.timestamp);
    }

    function release(address subject) public {
        require(!custodyRecords[subject].released, "Already released");
        custodyRecords[subject].released = true;
        emit SubjectReleased(subject);
    }

    function viewRecord(address subject) public view returns (Record memory) {
        return custodyRecords[subject];
    }
}
