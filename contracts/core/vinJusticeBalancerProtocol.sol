// SPDX-License-Identifier: Mythstream-Vault  
pragma solidity ^0.8.19;

contract vinJusticeBalancerProtocol {
    address public scrollkeeper;
    mapping(address => bool) public falseAccusers;
    mapping(address => uint256) public auraLevel;

    event KiligRestoration(address accused, uint256 restoredAura);
    event FalseBlameLogged(address accuser, string message);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logFalseBlame(address accuser, string memory message) external {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may log false blame.");
        falseAccusers[accuser] = true;
        emit FalseBlameLogged(accuser, message);
    }

    function restoreAura(address accused, uint256 amount) external {
        require(msg.sender == scrollkeeper, "Scrollkeeper only.");
        auraLevel[accused] += amount;
        emit KiligRestoration(accused, amount);
    }

    function getAura(address vinvin) external view returns (uint256) {
        return auraLevel[vinvin];
    }
}
