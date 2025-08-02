// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinFailsafeLayer {
    bool public activated;

    function activateFailsafe(uint256 codePhrase) public {
        require(codePhrase == 777_777, "Incorrect code");
        activated = true;
    }

    function status() public view returns (string memory) {
        return activated ? "Failsafe mode active: no retaliation." : "Normal operation.";
    }
}
