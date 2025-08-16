// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RestartMentorBadge {
    mapping(address => bool) public hasBadge;
    event BadgeMinted(address indexed mentor, string glyph, uint256 timestamp);

    function mintBadge(address mentor, string calldata glyph) external {
        require(!hasBadge[mentor], "Badge already minted");
        hasBadge[mentor] = true;
        emit BadgeMinted(mentor, glyph, block.timestamp);
    }

    function verifyBadge(address mentor) external view returns (bool) {
        return hasBadge[mentor];
    }
}
