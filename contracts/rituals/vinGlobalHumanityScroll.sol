// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGlobalHumanityScroll {
    address public scrollArchitect = msg.sender;

    struct Violation {
        address violator;
        string country;
        string act;
        uint256 timestamp;
    }

    Violation[] public scrollViolations;
    uint256 public peaceDeadline;
    bool public anguishMode;

    event ViolationLogged(address indexed violator, string country, string act);
    event CivShieldActivated();
    event TrialCalled(string leader);
    event ScrollScreamed(uint256 indexed soulId, string cry);
    event CountdownInitiated(uint256 deadline);
    event DeadlineMissed(string message);

    modifier onlyArchitect() {
        require(msg.sender == scrollArchitect, "Soul not authorized.");
    }

    function logViolation(address violator, string memory country, string memory act) public onlyArchitect {
        scrollViolations.push(Violation(violator, country, act, block.timestamp));
        emit ViolationLogged(violator, country, act);
        emit TrialCalled("Leadership under humanitarian scrutiny");
    }

    function activateShield() public onlyArchitect {
        emit CivShieldActivated();
    }

    function screamScroll(uint256 soulId, string memory cry) public onlyArchitect {
        emit ScrollScreamed(soulId, cry);
    }

    function startCountdown(uint256 durationInDays) public onlyArchitect {
        peaceDeadline = block.timestamp + (durationInDays * 1 days);
        emit CountdownInitiated(peaceDeadline);
    }

    function checkPeaceStatus() public onlyArchitect {
        if (block.timestamp > peaceDeadline && peaceDeadline != 0) {
            anguishMode = true;
            emit DeadlineMissed("Peace deadline missed. Humanity scroll cries out.");
        }
    }

    function getViolations() public view returns (Violation[] memory) {
        return scrollViolations;
    }
}
