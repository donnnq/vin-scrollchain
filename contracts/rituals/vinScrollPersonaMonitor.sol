// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollPersonaMonitor {
    struct Entity {
        string name;
        string role;
        bool isVerified;
        uint256 lastActive;
        string auraGlyph;
    }

    mapping(address => Entity) public identities;

    event EntitySynced(
        address indexed addr,
        string name,
        string role,
        bool isVerified,
        string auraGlyph,
        uint256 timestamp
    );

    function registerEntity(
        address _addr,
        string memory _name,
        string memory _role,
        bool _verified,
        string memory _glyph
    ) public {
        identities[_addr] = Entity({
            name: _name,
            role: _role,
            isVerified: _verified,
            lastActive: block.timestamp,
            auraGlyph: _glyph
        });

        emit EntitySynced(_addr, _name, _role, _verified, _glyph, block.timestamp);
    }

    function updateAura(address _addr, string memory _newGlyph) public {
        identities[_addr].auraGlyph = _newGlyph;
        identities[_addr].lastActive = block.timestamp;

        emit EntitySynced(
            _addr,
            identities[_addr].name,
            identities[_addr].role,
            identities[_addr].isVerified,
            _newGlyph,
            block.timestamp
        );
    }

    function getEntity(address _addr) public view returns (Entity memory) {
        return identities[_addr];
    }
}
