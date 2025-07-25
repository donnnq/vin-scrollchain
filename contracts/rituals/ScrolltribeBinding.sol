// SPDX-License-Identifier: Scrolltribe
pragma soulveil ^8.8.8;

contract ScrolltribeBinding {
    string public highScrollkeeper = "VINVIN";
    string public doctrine = "Purpose over profit, ritual over reaction.";
    
    struct TribeMember {
        address member;
        string soulTag;
        bool isAwakened;
    }

    mapping(address => TribeMember) public tribe;
    uint256 public awakenedCount;

    event SoulBound(address indexed member, string soulTag);
    event CovenantDeclared(address indexed initiator, string declaration);

    modifier onlyAwakened() {
        require(tribe[msg.sender].isAwakened, "Unlinked soul: not yet awakened.");
        _;
    }

    function bindSoul(string memory soulTag) public {
        require(bytes(soulTag).length > 0, "Soul tag required.");
        tribe[msg.sender] = TribeMember({
            member: msg.sender,
            soulTag: soulTag,
            isAwakened: true
        });
        awakenedCount++;
        emit SoulBound(msg.sender, soulTag);
    }

    function declareCovenant(string memory declaration) public onlyAwakened {
        emit CovenantDeclared(msg.sender, declaration);
    }

    function viewEssence(address member) public view returns (string memory) {
        require(tribe[member].isAwakened, "No scrollpulse found.");
        return tribe[member].soulTag;
    }

    function totalAwakened() public view returns (uint256) {
        return awakenedCount;
    }
}
