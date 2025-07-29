// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCivGuardianRitual {
    address public scrollInvoker = msg.sender;
    bool public shieldActive;

    event CiviliansProtected();
    event LeadershipCondemned(string name);

    modifier onlyInvoker() {
        require(msg.sender == scrollInvoker, "Not permitted.");
    }

    function activateCivShield() public onlyInvoker {
        shieldActive = true;
        emit CiviliansProtected();
    }

    function condemnLeader(string memory name) public onlyInvoker {
        emit LeadershipCondemned(name);
    }
}
