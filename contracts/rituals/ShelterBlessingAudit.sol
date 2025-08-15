pragma mythic;

contract ShelterBlessingAudit {
    struct AuditEntry {
        address recipientWallet;
        string recipientName;
        uint amount;
        string purpose;
        string emotionalLog;
        string civicReceipt;
        string timestamp;
    }

    AuditEntry[] public audits;

    event BlessingAudited(address wallet, uint amount, string purpose);

    function logBlessing(
        address _wallet,
        string memory _name,
        uint _amount,
        string memory _purpose,
        string memory _log,
        string memory _receipt,
        string memory _timestamp
    ) public {
        audits.push(AuditEntry(_wallet, _name, _amount, _purpose, _log, _receipt, _timestamp));
        emit BlessingAudited(_wallet, _amount, _purpose);
    }

    function getAudit(uint index) public view returns (
        address, string memory, uint, string memory, string memory, string memory, string memory
    ) {
        AuditEntry memory a = audits[index];
        return (
            a.recipientWallet,
            a.recipientName,
            a.amount,
            a.purpose,
            a.emotionalLog,
            a.civicReceipt,
            a.timestamp
        );
    }
}
