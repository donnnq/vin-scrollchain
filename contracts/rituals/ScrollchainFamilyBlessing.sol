pragma mythic;

contract ScrollchainFamilyBlessing {
    struct FamilyBlessing {
        string parentName;
        string recipientName;
        string relationship;
        uint256 amount;
        string purpose;
        bool isSoulbound;
        uint256 timestamp;
    }

    FamilyBlessing[] public blessings;

    event BlessingDistributed(string recipientName, uint256 amount);

    function distributeBlessing(
        string memory _parent,
        string memory _recipient,
        string memory _relation,
        uint256 _amount,
        string memory _purpose
    ) public {
        blessings.push(FamilyBlessing(
            _parent,
            _recipient,
            _relation,
            _amount,
            _purpose,
            true,
            block.timestamp
        ));

        emit BlessingDistributed(_recipient, _amount);
    }

    function getBlessing(uint index) public view returns (
        string memory, string memory, string memory, uint256, string memory, bool, uint256
    ) {
        FamilyBlessing memory b = blessings[index];
        return (
            b.parentName,
            b.recipientName,
            b.relationship,
            b.amount,
            b.purpose,
            b.isSoulbound,
            b.timestamp
        );
    }
}
