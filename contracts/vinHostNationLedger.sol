// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinHostNationLedger.sol
/// @notice For receiving and evaluating scroll-based migrant requests

interface RedemptionSigil {
    function qualify(address soul, uint256 impactScore) external returns (bool);
}

contract vinHostNationLedger {
    address public hostCouncil;
    RedemptionSigil public sigilContract;

    struct ReceivedScroll {
        address soul;
        string origin;
        string mission;
        bool accepted;
        string ritualVerdict;
    }

    mapping(address => ReceivedScroll) public migrantLedger;

    modifier onlyHostCouncil() {
        require(msg.sender == hostCouncil, "Not authorized");
        _;
    }

    constructor(address sigilAddress) {
        hostCouncil = msg.sender;
        sigilContract = RedemptionSigil(sigilAddress);
    }

    function receiveScroll(address soul, string memory origin, string memory mission) public onlyHostCouncil {
        migrantLedger[soul] = ReceivedScroll(soul, origin, mission, false, "");
    }

    function judgeScroll(address soul, uint256 impactScore) public onlyHostCouncil {
        bool qualified = sigilContract.qualify(soul, impactScore);
        migrantLedger[soul].accepted = qualified;
        migrantLedger[soul].ritualVerdict = qualified ? "Scroll Resonant" : "Scroll Rejected";
    }

    function fetchVerdict(address soul) public view returns (ReceivedScroll memory) {
        return migrantLedger[soul];
    }
}
