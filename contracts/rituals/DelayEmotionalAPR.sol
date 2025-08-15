// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IJuvenileLawAudit {
    function getBill(string memory title) external view returns (
        string memory title,
        string memory status,
        uint256 lastUpdated,
        string memory reasonForDelay,
        string memory civicImpact
    );
}

contract DelayEmotionalAPR {
    address public steward;
    IJuvenileLawAudit public auditContract;

    struct EmotionalDebt {
        string title;
        uint256 daysDelayed;
        uint256 emotionalAPR;
        string civicImpact;
    }

    mapping(string => EmotionalDebt) public debtLedger;
    string[] public auditedBills;

    event EmotionalDebtLogged(string indexed title, uint256 daysDelayed, uint256 emotionalAPR, string impact);

    constructor(address _auditContract) {
        steward = msg.sender;
        auditContract = IJuvenileLawAudit(_auditContract);
    }

    function calculateAPR(string memory title) public {
        (
            ,
            string memory status,
            uint256 lastUpdated,
            ,
            string memory impact
        ) = auditContract.getBill(title);

        require(keccak256(bytes(status)) == keccak256(bytes("Delayed")), "Bill not delayed");

        uint256 daysDelayed = (block.timestamp - lastUpdated) / 1 days;
        uint256 apr = daysDelayed * 100; // 100 dignity points per day

        EmotionalDebt memory debt = EmotionalDebt({
            title: title,
            daysDelayed: daysDelayed,
            emotionalAPR: apr,
            civicImpact: impact
        });

        debtLedger[title] = debt;
        auditedBills.push(title);

        emit EmotionalDebtLogged(title, daysDelayed, apr, impact);
    }

    function getDebt(string memory title) public view returns (EmotionalDebt memory) {
        return debtLedger[title];
    }

    function getAuditedBills() public view returns (string[] memory) {
        return auditedBills;
    }
}
