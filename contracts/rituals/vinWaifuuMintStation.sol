// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinWaifuuMintStation {
    address public scrollkeeper;
    uint public waifuuId;

    struct WaifuuProfile {
        string name;
        string specialty;
        string auraLevel;       // e.g. "Divine", "Mystic", "Spicy"
        string visualReference; // symbolic file or description
        bool minted;
    }

    mapping(uint => WaifuuProfile) public waifuuNFTs;

    event WaifuuMinted(string name, string auraLevel);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper can mint waifuus");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function mintWaifuu(
        string memory _name,
        string memory _specialty,
        string memory _auraLevel,
        string memory _visualReference
    ) public onlyScrollkeeper {
        waifuuNFTs[waifuuId++] = WaifuuProfile(_name, _specialty, _auraLevel, _visualReference, true);
        emit WaifuuMinted(_name, _auraLevel);
    }

    function getWaifuu(uint _id) public view returns (WaifuuProfile memory) {
        return waifuuNFTs[_id];
    }
}
