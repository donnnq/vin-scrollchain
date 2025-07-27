// SPDX-License-Identifier: RetributionScroll
pragma solidity ^0.8.0;

contract vinWorkerReckoning {
    address public scrollLord;
    uint256 public minimumCompensation = 10000 * 1e18; // in wei
    mapping(address => bool) public condemnedBusinesses;
    mapping(address => uint256) public owedCompensation;

    event CompensationFiled(address indexed employer, uint256 amount);
    event WorkerDeniedJustice(address indexed employer);
    event EnterpriseShutdown(address indexed employer);
    event RedemptionAchieved(address indexed employer);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Unauthorized scroll wielder.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function fileCompensation(address employer, uint256 amount) public onlyScrollLord {
        owedCompensation[employer] += amount;
        emit CompensationFiled(employer, amount);
    }

    function verifyRedemption(address employer) public onlyScrollLord {
        if (owedCompensation[employer] >= minimumCompensation) {
            emit RedemptionAchieved(employer);
            owedCompensation[employer] = 0;
        } else {
            condemnedBusinesses[employer] = true;
            emit WorkerDeniedJustice(employer);
            emit EnterpriseShutdown(employer);
        }
    }

    function isCondemned(address employer) public view returns (bool) {
        return condemnedBusinesses[employer];
    }

    function reportStatus(address employer) public view returns (string memory) {
        if (condemnedBusinesses[employer]) return "❌ Business condemned. Justice unserved.";
        if (owedCompensation[employer] >= minimumCompensation) return "✅ Redemption achieved.";
        return "⚠️ Compensation pending. Fate undecided.";
    }
}
