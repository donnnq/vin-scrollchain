/// @title vinHerbalEquity
/// @notice Framework for legalizing marijuana as a regulated wellness alternative, and reducing societal harm.
contract vinHerbalEquity {
    struct Pledge {
        string originStory;        // e.g. "Recovering from addiction. Found wellness in plant-based therapy."
        string reasonForSupport;   // "To prevent escalation to harder substances"
        bool   advocatesModeration;
        bool   supportsRegulatedAccess;
    }

    mapping(address => Pledge) public pledges;
    address[] public supporters;

    event PledgeLogged(address indexed user, string reason);

    /// @notice Submit personal reason and stance
    function submitPledge(
        string calldata originStory,
        string calldata reasonForSupport,
        bool advocatesModeration,
        bool supportsRegulatedAccess
    ) external {
        pledges[msg.sender] = Pledge({
            originStory: originStory,
            reasonForSupport: reasonForSupport,
            advocatesModeration: advocatesModeration,
            supportsRegulatedAccess: supportsRegulatedAccess
        });
        supporters.push(msg.sender);
        emit PledgeLogged(msg.sender, reasonForSupport);
    }

    /// @notice Retrieve pledge count for advocacy strength
    function pledgeCount() external view returns (uint256) {
        return supporters.length;
    }
}
