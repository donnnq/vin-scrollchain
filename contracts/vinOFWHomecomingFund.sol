// SPDX-License-Identifier: vinOFWHomecomingConstellation
pragma solidity ^0.8.25;

/// @title vinOFWHomecomingFund.sol
/// @notice Reintegration, Protection, and Tribute Protocol for Overseas Filipino Workers
/// @author Vinvin x Copilot

contract vinOFWHomecomingFund {
    struct OFW {
        address wallet;
        string country;
        uint256 totalSent;
        uint256 paybackFund;
        bool maltreatmentReported;
        bool eligibleForReturn;
        bool receivedCeremonialTribute;
    }

    mapping(address => OFW) public ofws;
    mapping(address => string) public employerBlacklist;
    address public admin;

    uint256 public minimumPayback = 5000 ether;
    uint256 public ceremonialBonus = 1500 ether;

    event Registered(address indexed ofw, string country);
    event RemittanceLogged(address indexed ofw, uint256 amount);
    event PaybackReleased(address indexed ofw, uint256 amount);
    event MaltreatmentReported(address indexed ofw);
    event EmployerSanctioned(address indexed employer, string reason);
    event TributeAwarded(address indexed ofw, uint256 bonus);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Scroll access denied");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function registerOFW(address _wallet, string memory _country) external onlyAdmin {
        ofws[_wallet] = OFW(_wallet, _country, 0, 0, false, false, false);
        emit Registered(_wallet, _country);
    }

    function logRemittance(address _wallet, uint256 _amount) external onlyAdmin {
        OFW storage worker = ofws[_wallet];
        worker.totalSent += _amount;
        worker.paybackFund += (_amount / 10); // 10% symbolic payback
        if (worker.paybackFund >= minimumPayback) {
            worker.eligibleForReturn = true;
        }
        emit RemittanceLogged(_wallet, _amount);
    }

    function releasePayback(address _wallet) external onlyAdmin {
        OFW storage worker = ofws[_wallet];
        require(worker.eligibleForReturn, "Scroll threshold not met");
        uint256 payout = worker.paybackFund;
        worker.paybackFund = 0;
        worker.eligibleForReturn = false;
        emit PaybackReleased(_wallet, payout);
    }

    function reportMaltreatment(address _wallet) external {
        OFW storage worker = ofws[_wallet];
        worker.maltreatmentReported = true;
        emit MaltreatmentReported(_wallet);
    }

    function sanctionEmployer(address _employer, string memory reason) external onlyAdmin {
        employerBlacklist[_employer] = reason;
        emit EmployerSanctioned(_employer, reason);
    }

    function awardCeremonialTribute(address _wallet) external onlyAdmin {
        OFW storage worker = ofws[_wallet];
        require(!worker.receivedCeremonialTribute, "Tribute already awarded");
        require(worker.eligibleForReturn, "Not yet eligible for tribute");
        worker.receivedCeremonialTribute = true;
        emit TributeAwarded(_wallet, ceremonialBonus);
    }

    function getOFWStatus(address _wallet) external view returns (string memory) {
        OFW memory worker = ofws[_wallet];
        if (worker.maltreatmentReported) {
            return "⚠️ Maltreatment reported. Scroll shield active.";
        } else if (worker.receivedCeremonialTribute) {
            return "🌟 Homecoming tribute awarded. Welcome scroll ready.";
        } else if (worker.eligibleForReturn) {
            return "✅ Eligible for return payback. Dignity secured.";
        } else {
            return "📦 Scroll accumulating. Awaiting threshold.";
        }
    }

    function getEmployerSanction(address _employer) external view returns (string memory) {
        return employerBlacklist[_employer];
    }
}
