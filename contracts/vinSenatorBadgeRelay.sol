// SPDX-License-Identifier: SENATE-BADGE-RELAY
pragma solidity ^0.8.19;

contract vinSenatorBadgeRelay {
    mapping(address => string) public alignments;
    event BadgeVerified(address senator, string alignment);

    function assignBadge(address senator, string calldata alignment) external {
        alignments[senator] = alignment;
        emit BadgeVerified(senator, alignment);
    }

    function verifyAlignment(address senator) external view returns (string memory) {
        return alignments[senator];
    }
}
