// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBadgeFusionSigil {
    mapping(address => bool) public hasSigil;

    event SigilFused(address indexed official);

    function fuseBadges(address _addr, uint8 badgeCount) public {
        require(badgeCount == 8, "Need 8 badges to fuse");
        require(!hasSigil[_addr], "Already fused");
        hasSigil[_addr] = true;
        emit SigilFused(_addr);
    }

    function isPrestige(address _addr) public view returns (bool) {
        return hasSigil[_addr];
    }
}
