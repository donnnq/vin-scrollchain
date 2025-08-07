// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCitizenSoulbound {
    address public soulAdmin;

    mapping(address => uint256) public civicMerit;
    mapping(address => bool) public hasSoulbound;

    event SoulboundMinted(address citizen, uint256 merit);

    modifier onlyAdmin() {
        require(msg.sender == soulAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        soulAdmin = _admin;
    }

    function recordVote(address voter) external onlyAdmin {
        civicMerit[voter] += 1;

        if (!hasSoulbound[voter]) {
            hasSoulbound[voter] = true;
            emit SoulboundMinted(voter, civicMerit[voter]);
        }
    }

    function getMerit(address voter) external view returns (uint256) {
        return civicMerit[voter];
    }

    function hasSigil(address voter) external view returns (bool) {
        return hasSoulbound[voter];
    }
}
