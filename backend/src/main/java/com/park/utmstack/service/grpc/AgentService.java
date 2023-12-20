// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: agent.proto

package com.park.utmstack.service.grpc;

/**
 * Protobuf service {@code agent.AgentService}
 */
public  abstract class AgentService
    implements com.google.protobuf.Service {
  protected AgentService() {}

  public interface Interface {
    /**
     * <code>rpc AgentStream(stream .agent.BidirectionalStream) returns (stream .agent.BidirectionalStream);</code>
     */
    public abstract void agentStream(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.BidirectionalStream request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.BidirectionalStream> done);

    /**
     * <code>rpc ListAgents(.agent.ListRequest) returns (.agent.ListAgentsResponse);</code>
     */
    public abstract void listAgents(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done);

    /**
     * <code>rpc UpdateAgentType(.agent.AgentTypeUpdate) returns (.agent.Agent);</code>
     */
    public abstract void updateAgentType(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentTypeUpdate request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

    /**
     * <code>rpc UpdateAgentGroup(.agent.AgentGroupUpdate) returns (.agent.Agent);</code>
     */
    public abstract void updateAgentGroup(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentGroupUpdate request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

    /**
     * <code>rpc ListAgentCommands(.agent.ListRequest) returns (.agent.ListAgentsCommandsResponse);</code>
     */
    public abstract void listAgentCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsCommandsResponse> done);

    /**
     * <code>rpc GetAgentByHostname(.agent.Hostname) returns (.agent.Agent);</code>
     */
    public abstract void getAgentByHostname(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.Hostname request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

    /**
     * <code>rpc ListAgentsWithCommands(.agent.ListRequest) returns (.agent.ListAgentsResponse);</code>
     */
    public abstract void listAgentsWithCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done);

    /**
     * <code>rpc DeleteAgent(.agent.AgentDelete) returns (.agent.AgentResponse);</code>
     */
    public abstract void deleteAgent(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentDelete request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.AgentResponse> done);

  }

  public static com.google.protobuf.Service newReflectiveService(
      final Interface impl) {
    return new AgentService() {
      @java.lang.Override
      public  void agentStream(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.BidirectionalStream request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.BidirectionalStream> done) {
        impl.agentStream(controller, request, done);
      }

      @java.lang.Override
      public  void listAgents(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.ListRequest request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done) {
        impl.listAgents(controller, request, done);
      }

      @java.lang.Override
      public  void updateAgentType(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.AgentTypeUpdate request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
        impl.updateAgentType(controller, request, done);
      }

      @java.lang.Override
      public  void updateAgentGroup(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.AgentGroupUpdate request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
        impl.updateAgentGroup(controller, request, done);
      }

      @java.lang.Override
      public  void listAgentCommands(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.ListRequest request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsCommandsResponse> done) {
        impl.listAgentCommands(controller, request, done);
      }

      @java.lang.Override
      public  void getAgentByHostname(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.Hostname request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
        impl.getAgentByHostname(controller, request, done);
      }

      @java.lang.Override
      public  void listAgentsWithCommands(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.ListRequest request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done) {
        impl.listAgentsWithCommands(controller, request, done);
      }

      @java.lang.Override
      public  void deleteAgent(
          com.google.protobuf.RpcController controller,
          com.park.utmstack.service.grpc.AgentDelete request,
          com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.AgentResponse> done) {
        impl.deleteAgent(controller, request, done);
      }

    };
  }

  public static com.google.protobuf.BlockingService
      newReflectiveBlockingService(final BlockingInterface impl) {
    return new com.google.protobuf.BlockingService() {
      public final com.google.protobuf.Descriptors.ServiceDescriptor
          getDescriptorForType() {
        return getDescriptor();
      }

      public final com.google.protobuf.Message callBlockingMethod(
          com.google.protobuf.Descriptors.MethodDescriptor method,
          com.google.protobuf.RpcController controller,
          com.google.protobuf.Message request)
          throws com.google.protobuf.ServiceException {
        if (method.getService() != getDescriptor()) {
          throw new java.lang.IllegalArgumentException(
            "Service.callBlockingMethod() given method descriptor for " +
            "wrong service type.");
        }
        switch(method.getIndex()) {
          case 0:
            return impl.agentStream(controller, (com.park.utmstack.service.grpc.BidirectionalStream)request);
          case 1:
            return impl.listAgents(controller, (com.park.utmstack.service.grpc.ListRequest)request);
          case 2:
            return impl.updateAgentType(controller, (com.park.utmstack.service.grpc.AgentTypeUpdate)request);
          case 3:
            return impl.updateAgentGroup(controller, (com.park.utmstack.service.grpc.AgentGroupUpdate)request);
          case 4:
            return impl.listAgentCommands(controller, (com.park.utmstack.service.grpc.ListRequest)request);
          case 5:
            return impl.getAgentByHostname(controller, (com.park.utmstack.service.grpc.Hostname)request);
          case 6:
            return impl.listAgentsWithCommands(controller, (com.park.utmstack.service.grpc.ListRequest)request);
          case 7:
            return impl.deleteAgent(controller, (com.park.utmstack.service.grpc.AgentDelete)request);
          default:
            throw new java.lang.AssertionError("Can't get here.");
        }
      }

      public final com.google.protobuf.Message
          getRequestPrototype(
          com.google.protobuf.Descriptors.MethodDescriptor method) {
        if (method.getService() != getDescriptor()) {
          throw new java.lang.IllegalArgumentException(
            "Service.getRequestPrototype() given method " +
            "descriptor for wrong service type.");
        }
        switch(method.getIndex()) {
          case 0:
            return com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance();
          case 1:
            return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
          case 2:
            return com.park.utmstack.service.grpc.AgentTypeUpdate.getDefaultInstance();
          case 3:
            return com.park.utmstack.service.grpc.AgentGroupUpdate.getDefaultInstance();
          case 4:
            return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
          case 5:
            return com.park.utmstack.service.grpc.Hostname.getDefaultInstance();
          case 6:
            return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
          case 7:
            return com.park.utmstack.service.grpc.AgentDelete.getDefaultInstance();
          default:
            throw new java.lang.AssertionError("Can't get here.");
        }
      }

      public final com.google.protobuf.Message
          getResponsePrototype(
          com.google.protobuf.Descriptors.MethodDescriptor method) {
        if (method.getService() != getDescriptor()) {
          throw new java.lang.IllegalArgumentException(
            "Service.getResponsePrototype() given method " +
            "descriptor for wrong service type.");
        }
        switch(method.getIndex()) {
          case 0:
            return com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance();
          case 1:
            return com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance();
          case 2:
            return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
          case 3:
            return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
          case 4:
            return com.park.utmstack.service.grpc.ListAgentsCommandsResponse.getDefaultInstance();
          case 5:
            return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
          case 6:
            return com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance();
          case 7:
            return com.park.utmstack.service.grpc.AgentResponse.getDefaultInstance();
          default:
            throw new java.lang.AssertionError("Can't get here.");
        }
      }

    };
  }

  /**
   * <code>rpc AgentStream(stream .agent.BidirectionalStream) returns (stream .agent.BidirectionalStream);</code>
   */
  public abstract void agentStream(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.BidirectionalStream request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.BidirectionalStream> done);

  /**
   * <code>rpc ListAgents(.agent.ListRequest) returns (.agent.ListAgentsResponse);</code>
   */
  public abstract void listAgents(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.ListRequest request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done);

  /**
   * <code>rpc UpdateAgentType(.agent.AgentTypeUpdate) returns (.agent.Agent);</code>
   */
  public abstract void updateAgentType(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.AgentTypeUpdate request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

  /**
   * <code>rpc UpdateAgentGroup(.agent.AgentGroupUpdate) returns (.agent.Agent);</code>
   */
  public abstract void updateAgentGroup(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.AgentGroupUpdate request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

  /**
   * <code>rpc ListAgentCommands(.agent.ListRequest) returns (.agent.ListAgentsCommandsResponse);</code>
   */
  public abstract void listAgentCommands(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.ListRequest request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsCommandsResponse> done);

  /**
   * <code>rpc GetAgentByHostname(.agent.Hostname) returns (.agent.Agent);</code>
   */
  public abstract void getAgentByHostname(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.Hostname request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done);

  /**
   * <code>rpc ListAgentsWithCommands(.agent.ListRequest) returns (.agent.ListAgentsResponse);</code>
   */
  public abstract void listAgentsWithCommands(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.ListRequest request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done);

  /**
   * <code>rpc DeleteAgent(.agent.AgentDelete) returns (.agent.AgentResponse);</code>
   */
  public abstract void deleteAgent(
      com.google.protobuf.RpcController controller,
      com.park.utmstack.service.grpc.AgentDelete request,
      com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.AgentResponse> done);

  public static final
      com.google.protobuf.Descriptors.ServiceDescriptor
      getDescriptor() {
    return com.park.utmstack.service.grpc.AgentManagerGrpc.getDescriptor().getServices().get(0);
  }
  public final com.google.protobuf.Descriptors.ServiceDescriptor
      getDescriptorForType() {
    return getDescriptor();
  }

  public final void callMethod(
      com.google.protobuf.Descriptors.MethodDescriptor method,
      com.google.protobuf.RpcController controller,
      com.google.protobuf.Message request,
      com.google.protobuf.RpcCallback<
        com.google.protobuf.Message> done) {
    if (method.getService() != getDescriptor()) {
      throw new java.lang.IllegalArgumentException(
        "Service.callMethod() given method descriptor for wrong " +
        "service type.");
    }
    switch(method.getIndex()) {
      case 0:
        this.agentStream(controller, (com.park.utmstack.service.grpc.BidirectionalStream)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.BidirectionalStream>specializeCallback(
            done));
        return;
      case 1:
        this.listAgents(controller, (com.park.utmstack.service.grpc.ListRequest)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.ListAgentsResponse>specializeCallback(
            done));
        return;
      case 2:
        this.updateAgentType(controller, (com.park.utmstack.service.grpc.AgentTypeUpdate)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.Agent>specializeCallback(
            done));
        return;
      case 3:
        this.updateAgentGroup(controller, (com.park.utmstack.service.grpc.AgentGroupUpdate)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.Agent>specializeCallback(
            done));
        return;
      case 4:
        this.listAgentCommands(controller, (com.park.utmstack.service.grpc.ListRequest)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.ListAgentsCommandsResponse>specializeCallback(
            done));
        return;
      case 5:
        this.getAgentByHostname(controller, (com.park.utmstack.service.grpc.Hostname)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.Agent>specializeCallback(
            done));
        return;
      case 6:
        this.listAgentsWithCommands(controller, (com.park.utmstack.service.grpc.ListRequest)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.ListAgentsResponse>specializeCallback(
            done));
        return;
      case 7:
        this.deleteAgent(controller, (com.park.utmstack.service.grpc.AgentDelete)request,
          com.google.protobuf.RpcUtil.<com.park.utmstack.service.grpc.AgentResponse>specializeCallback(
            done));
        return;
      default:
        throw new java.lang.AssertionError("Can't get here.");
    }
  }

  public final com.google.protobuf.Message
      getRequestPrototype(
      com.google.protobuf.Descriptors.MethodDescriptor method) {
    if (method.getService() != getDescriptor()) {
      throw new java.lang.IllegalArgumentException(
        "Service.getRequestPrototype() given method " +
        "descriptor for wrong service type.");
    }
    switch(method.getIndex()) {
      case 0:
        return com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance();
      case 1:
        return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
      case 2:
        return com.park.utmstack.service.grpc.AgentTypeUpdate.getDefaultInstance();
      case 3:
        return com.park.utmstack.service.grpc.AgentGroupUpdate.getDefaultInstance();
      case 4:
        return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
      case 5:
        return com.park.utmstack.service.grpc.Hostname.getDefaultInstance();
      case 6:
        return com.park.utmstack.service.grpc.ListRequest.getDefaultInstance();
      case 7:
        return com.park.utmstack.service.grpc.AgentDelete.getDefaultInstance();
      default:
        throw new java.lang.AssertionError("Can't get here.");
    }
  }

  public final com.google.protobuf.Message
      getResponsePrototype(
      com.google.protobuf.Descriptors.MethodDescriptor method) {
    if (method.getService() != getDescriptor()) {
      throw new java.lang.IllegalArgumentException(
        "Service.getResponsePrototype() given method " +
        "descriptor for wrong service type.");
    }
    switch(method.getIndex()) {
      case 0:
        return com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance();
      case 1:
        return com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance();
      case 2:
        return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
      case 3:
        return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
      case 4:
        return com.park.utmstack.service.grpc.ListAgentsCommandsResponse.getDefaultInstance();
      case 5:
        return com.park.utmstack.service.grpc.Agent.getDefaultInstance();
      case 6:
        return com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance();
      case 7:
        return com.park.utmstack.service.grpc.AgentResponse.getDefaultInstance();
      default:
        throw new java.lang.AssertionError("Can't get here.");
    }
  }

  public static Stub newStub(
      com.google.protobuf.RpcChannel channel) {
    return new Stub(channel);
  }

  public static final class Stub extends com.park.utmstack.service.grpc.AgentService implements Interface {
    private Stub(com.google.protobuf.RpcChannel channel) {
      this.channel = channel;
    }

    private final com.google.protobuf.RpcChannel channel;

    public com.google.protobuf.RpcChannel getChannel() {
      return channel;
    }

    public  void agentStream(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.BidirectionalStream request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.BidirectionalStream> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(0),
        controller,
        request,
        com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.BidirectionalStream.class,
          com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance()));
    }

    public  void listAgents(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(1),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.ListAgentsResponse.class,
          com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance()));
    }

    public  void updateAgentType(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentTypeUpdate request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(2),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.Agent.class,
          com.park.utmstack.service.grpc.Agent.getDefaultInstance()));
    }

    public  void updateAgentGroup(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentGroupUpdate request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(3),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.Agent.class,
          com.park.utmstack.service.grpc.Agent.getDefaultInstance()));
    }

    public  void listAgentCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsCommandsResponse> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(4),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsCommandsResponse.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.ListAgentsCommandsResponse.class,
          com.park.utmstack.service.grpc.ListAgentsCommandsResponse.getDefaultInstance()));
    }

    public  void getAgentByHostname(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.Hostname request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.Agent> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(5),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.Agent.class,
          com.park.utmstack.service.grpc.Agent.getDefaultInstance()));
    }

    public  void listAgentsWithCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.ListAgentsResponse> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(6),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.ListAgentsResponse.class,
          com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance()));
    }

    public  void deleteAgent(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentDelete request,
        com.google.protobuf.RpcCallback<com.park.utmstack.service.grpc.AgentResponse> done) {
      channel.callMethod(
        getDescriptor().getMethods().get(7),
        controller,
        request,
        com.park.utmstack.service.grpc.AgentResponse.getDefaultInstance(),
        com.google.protobuf.RpcUtil.generalizeCallback(
          done,
          com.park.utmstack.service.grpc.AgentResponse.class,
          com.park.utmstack.service.grpc.AgentResponse.getDefaultInstance()));
    }
  }

  public static BlockingInterface newBlockingStub(
      com.google.protobuf.BlockingRpcChannel channel) {
    return new BlockingStub(channel);
  }

  public interface BlockingInterface {
    public com.park.utmstack.service.grpc.BidirectionalStream agentStream(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.BidirectionalStream request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.ListAgentsResponse listAgents(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.Agent updateAgentType(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentTypeUpdate request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.Agent updateAgentGroup(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentGroupUpdate request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.ListAgentsCommandsResponse listAgentCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.Agent getAgentByHostname(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.Hostname request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.ListAgentsResponse listAgentsWithCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException;

    public com.park.utmstack.service.grpc.AgentResponse deleteAgent(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentDelete request)
        throws com.google.protobuf.ServiceException;
  }

  private static final class BlockingStub implements BlockingInterface {
    private BlockingStub(com.google.protobuf.BlockingRpcChannel channel) {
      this.channel = channel;
    }

    private final com.google.protobuf.BlockingRpcChannel channel;

    public com.park.utmstack.service.grpc.BidirectionalStream agentStream(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.BidirectionalStream request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.BidirectionalStream) channel.callBlockingMethod(
        getDescriptor().getMethods().get(0),
        controller,
        request,
        com.park.utmstack.service.grpc.BidirectionalStream.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.ListAgentsResponse listAgents(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.ListAgentsResponse) channel.callBlockingMethod(
        getDescriptor().getMethods().get(1),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.Agent updateAgentType(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentTypeUpdate request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.Agent) channel.callBlockingMethod(
        getDescriptor().getMethods().get(2),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.Agent updateAgentGroup(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentGroupUpdate request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.Agent) channel.callBlockingMethod(
        getDescriptor().getMethods().get(3),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.ListAgentsCommandsResponse listAgentCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.ListAgentsCommandsResponse) channel.callBlockingMethod(
        getDescriptor().getMethods().get(4),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsCommandsResponse.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.Agent getAgentByHostname(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.Hostname request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.Agent) channel.callBlockingMethod(
        getDescriptor().getMethods().get(5),
        controller,
        request,
        com.park.utmstack.service.grpc.Agent.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.ListAgentsResponse listAgentsWithCommands(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.ListRequest request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.ListAgentsResponse) channel.callBlockingMethod(
        getDescriptor().getMethods().get(6),
        controller,
        request,
        com.park.utmstack.service.grpc.ListAgentsResponse.getDefaultInstance());
    }


    public com.park.utmstack.service.grpc.AgentResponse deleteAgent(
        com.google.protobuf.RpcController controller,
        com.park.utmstack.service.grpc.AgentDelete request)
        throws com.google.protobuf.ServiceException {
      return (com.park.utmstack.service.grpc.AgentResponse) channel.callBlockingMethod(
        getDescriptor().getMethods().get(7),
        controller,
        request,
        com.park.utmstack.service.grpc.AgentResponse.getDefaultInstance());
    }

  }

  // @@protoc_insertion_point(class_scope:agent.AgentService)
}
