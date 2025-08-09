// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SignalSanctum {
    address public scrollsmith;
    bool public internetRestored;
    mapping(address => bool) public verifiedCitizens;
    mapping(address => string) public dataChannels;

    event SignalRestored();
    event CitizenVerified(address indexed citizen);
    event DataChannelAssigned(address indexed citizen, string channel);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    modifier onlyVerified() {
        require(verifiedCitizens[msg.sender], "Not verified");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
        internetRestored = false;
    }

    function restoreSignal() external onlyScrollsmith {
        internetRestored = true;
        emit SignalRestored();
    }

    function verifyCitizen(address citizen) external onlyScrollsmith {
        verifiedCitizens[citizen] = true;
        emit CitizenVerified(citizen);
    }

    function assignDataChannel(address citizen, string calldata channel) external onlyScrollsmith {
        require(verifiedCitizens[citizen], "Citizen not verified");
        dataChannels[citizen] = channel;
        emit DataChannelAssigned(citizen, channel);
    }

    function getMyChannel() external view onlyVerified returns (string memory) {
        return dataChannels[msg.sender];
    }

    function isSignalLive() external view returns (bool) {
        return internetRestored;
    }
}
