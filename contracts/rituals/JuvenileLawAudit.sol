// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract JuvenileLawAudit {
    address public steward;

    struct ReformBill {
        string title;
        string status; // e.g., "Pending", "Delayed", "Funded", "Rejected"
        uint256 lastUpdated;
        string reasonForDelay;
        string civicImpact;
    }

    mapping(string => ReformBill) public bills;
    string[] public billTitles;

    event BillLogged(string indexed title, string status, string reason, string impact);
    event StatusUpdated(string indexed title, string newStatus);

    constructor() {
        steward = msg.sender;
    }

    function logBill(
        string memory title,
        string memory status,
        string memory reason,
        string memory impact
    ) public {
        require(msg.sender == steward, "Only steward can log");

        ReformBill memory bill = ReformBill({
            title: title,
            status: status,
            lastUpdated: block.timestamp,
            reasonForDelay: reason,
            civicImpact: impact
        });

        bills[title] = bill;
        billTitles.push(title);

        emit BillLogged(title, status, reason, impact);
    }

    function updateStatus(string memory title, string memory newStatus) public {
        require(msg.sender == steward, "Only steward can update");
        require(bytes(bills[title].title).length != 0, "Bill not found");

        bills[title].status = newStatus;
        bills[title].lastUpdated = block.timestamp;

        emit StatusUpdated(title, newStatus);
    }

    function getBill(string memory title) public view returns (ReformBill memory) {
        return bills[title];
    }

    function getAllBills() public view returns (string[] memory) {
        return billTitles;
    }
}
