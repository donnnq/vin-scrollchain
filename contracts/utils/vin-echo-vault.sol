// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinEchoVault {
    struct Echo {
        address sender;
        string messageHash; // Can be a hash, encrypted string, or symbolic phrase
        uint256 timestamp;
    }

    Echo[] public echoes;

    event EchoRecorded(address indexed sender, string messageHash, uint256 indexed echoId);

    function recordEcho(string calldata messageHash) external {
        echoes.push(Echo({
            sender: msg.sender,
            messageHash: messageHash,
            timestamp: block.timestamp
        }));

        emit EchoRecorded(msg.sender, messageHash, echoes.length - 1);
    }

    function totalEchoes() external view returns (uint256) {
        return echoes.length;
    }

    function getEcho(uint256 index) external view returns (Echo memory) {
        require(index < echoes.length, "Invalid echo index");
        return echoes[index];
    }
}
