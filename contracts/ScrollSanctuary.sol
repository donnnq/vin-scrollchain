// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollSanctuary {
    struct Mascot {
        string name;
        uint256 injuryLevel;
        uint256 lastHeal;
        bool alive;
    }

    mapping(address => Mascot[]) public injuredMascots;

    event Healed(address indexed owner, uint256 mascotId);
    event Lost(address indexed owner, uint256 mascotId);

    function healMascot(uint256 mascotId) external {
        Mascot storage m = injuredMascots[msg.sender][mascotId];
        require(m.alive, "Mascot already gone");
        require(block.timestamp >= m.lastHeal + 1 hours, "Still healing");
        if (m.injuryLevel >= 100) {
            m.alive = false;
            emit Lost(msg.sender, mascotId);
        } else {
            m.injuryLevel = 0;
            m.lastHeal = block.timestamp;
            emit Healed(msg.sender, mascotId);
        }
    }
}
