// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfSanctifiedSupplyChain {
    address public sovereignCouncil;

    struct SupplyNode {
        string name;
        string country;
        bool isSanctified;
    }

    struct Transfer {
        uint originNodeId;
        uint destinationNodeId;
        string itemDescription;
        string ancestralGlyph;
        string civicSigil;
        bool completed;
    }

    SupplyNode[] public nodes;
    Transfer[] public transfers;

    event NodeSanctified(uint indexed nodeId, string name, string country);
    event TransferInitiated(uint indexed transferId, string item);
    event TransferCompleted(uint indexed transferId, string glyph, string sigil);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function addNode(string memory name, string memory country) public onlyCouncil {
        nodes.push(SupplyNode({
            name: name,
            country: country,
            isSanctified: false
        }));
    }

    function sanctifyNode(uint nodeId) public onlyCouncil {
        nodes[nodeId].isSanctified = true;
        emit NodeSanctified(nodeId, nodes[nodeId].name, nodes[nodeId].country);
    }

    function initiateTransfer(
        uint originNodeId,
        uint destinationNodeId,
        string memory itemDescription,
        string memory ancestralGlyph,
        string memory civicSigil
    ) public onlyCouncil {
        require(nodes[originNodeId].isSanctified, "Origin not sanctified");
        require(nodes[destinationNodeId].isSanctified, "Destination not sanctified");

        transfers.push(Transfer({
            originNodeId: originNodeId,
            destinationNodeId: destinationNodeId,
            itemDescription: itemDescription,
            ancestralGlyph: ancestralGlyph,
            civicSigil: civicSigil,
            completed: false
        }));

        emit TransferInitiated(transfers.length - 1, itemDescription);
    }

    function completeTransfer(uint transferId) public onlyCouncil {
        require(!transfers[transferId].completed, "Already completed");
        transfers[transferId].completed = true;
        emit TransferCompleted(
            transferId,
            transfers[transferId].ancestralGlyph,
            transfers[transferId].civicSigil
        );
    }
}
