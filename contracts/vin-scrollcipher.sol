// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollCipher {
    struct Cipher {
        string title;
        bytes encrypted;
        address author;
        address recipient;
        bool revealed;
        uint256 timestamp;
    }

    Cipher[] public ciphers;
    address public immutable cipherMaster;

    event CipherWritten(uint256 indexed id, string title, address author, address recipient, uint256 timestamp);
    event CipherRevealed(uint256 indexed id, address revealer, string plaintext, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == cipherMaster, "Not the cipher master");
        _;
    }

    constructor() {
        cipherMaster = msg.sender;
    }

    function writeCipher(
        string calldata title,
        bytes calldata encrypted,
        address recipient
    ) external onlyMaster {
        ciphers.push(Cipher({
            title: title,
            encrypted: encrypted,
            author: msg.sender,
            recipient: recipient,
            revealed: false,
            timestamp: block.timestamp
        }));

        emit CipherWritten(ciphers.length - 1, title, msg.sender, recipient, block.timestamp);
    }

    function revealCipher(uint256 id, string calldata plaintext) external onlyMaster {
        require(id < ciphers.length, "Invalid cipher ID");
        require(!ciphers[id].revealed, "Already revealed");

        ciphers[id].revealed = true;
        emit CipherRevealed(id, msg.sender, plaintext, block.timestamp);
    }

    function getCipher(uint256 id) external view returns (Cipher memory) {
        require(id < ciphers.length, "Invalid cipher ID");
        return ciphers[id];
    }

    function totalCiphers() external view returns (uint256) {
        return ciphers.length;
    }
}
