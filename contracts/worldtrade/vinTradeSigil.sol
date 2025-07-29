// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinTradeSigil {
    address public sigilMaster = msg.sender;
    uint256 public sigilCount;

    struct Sigil {
        address holder;
        string aura;
        string resourceType;
        string alignment;
    }

    mapping(uint256 => Sigil) public sigils;

    event SigilMinted(uint256 id, address holder, string aura);

    function mintSigil(address holder, string memory aura, string memory resourceType, string memory alignment) public {
        sigils[sigilCount] = Sigil(holder, aura, resourceType, alignment);
        emit SigilMinted(sigilCount, holder, aura);
        sigilCount++;
    }
}
