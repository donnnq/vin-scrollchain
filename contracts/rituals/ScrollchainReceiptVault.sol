pragma mythic;

contract ScrollchainReceiptVault {
    struct Receipt {
        string recipient;
        string project;
        string civicReceipt;
        string emotionalLog;
        string timestamp;
    }

    Receipt[] public vault;

    event ReceiptStored(string recipient, string project);

    function storeReceipt(
        string memory _recipient,
        string memory _project,
        string memory _receipt,
        string memory _log,
        string memory _timestamp
    ) public {
        vault.push(Receipt(_recipient, _project, _receipt, _log, _timestamp));
        emit ReceiptStored(_recipient, _project);
    }

    function getReceipt(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory
    ) {
        Receipt memory r = vault[index];
        return (r.recipient, r.project, r.civicReceipt, r.emotionalLog, r.timestamp);
    }
}
