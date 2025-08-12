// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.19;

contract vinPamanaVault {
    address public scrollsmith;

    struct Pamana {
        string blessing;
        string encryptedMessage;
        bool claimed;
    }

    mapping(address => Pamana) public vault;

    event PamanaStored(address indexed heir, string blessing);
    event PamanaClaimed(address indexed heir);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized: Only Vinvin may store pamana.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function storePamana(address heir, string memory blessing, string memory encryptedMessage) external onlyScrollsmith {
        require(!vault[heir].claimed, "Pamana already claimed.");
        vault[heir] = Pamana(blessing, encryptedMessage, false);
        emit PamanaStored(heir, blessing);
    }

    function claimPamana() external {
        require(!vault[msg.sender].claimed, "Already claimed.");
        require(bytes(vault[msg.sender].blessing).length > 0, "No pamana stored.");
        vault[msg.sender].claimed = true;
        emit PamanaClaimed(msg.sender);
    }

    function viewPamana(address heir) external view returns (string memory, string memory, bool) {
        Pamana memory p = vault[heir];
        return (p.blessing, p.encryptedMessage, p.claimed);
    }
}
