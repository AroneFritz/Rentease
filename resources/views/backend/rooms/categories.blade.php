@extends('backend.layout')

{{-- this style will be applied when the direction of language is right-to-left --}}
@includeIf('backend.partials.rtl_style')

@section('content')
  <div class="page-header">
    <h4 class="page-title">{{ __('Categories') }}</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('admin.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Rooms Management') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Categories') }}</a>
      </li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-lg-4">
              <div class="card-title d-inline-block">{{ __('Room Categories') }}</div>
            </div>

            <div class="col-lg-3">
              @includeIf('backend.partials.languages')
            </div>

            <div class="col-lg-4 offset-lg-1 mt-2 mt-lg-0">
              <a href="#" data-toggle="modal" data-target="#createModal"
                class="btn btn-primary btn-sm float-lg-right float-left"><i class="fas fa-plus"></i>
                {{ __('Add Category') }}</a>

              <button class="btn btn-danger btn-sm float-right mr-2 d-none bulk-delete"
                data-href="{{ route('admin.rooms_management.bulk_delete_category') }}"><i
                  class="flaticon-interface-5"></i> {{ __('Delete') }}</button>
            </div>
          </div>
        </div>

        <div class="card-body">
          <div class="row">
            <div class="col-lg-12">
              @if (count($roomCategories) == 0)
                <h3 class="text-center">{{ __('NO ROOM CATEGORY FOUND!') }}</h3>
              @else
                <div class="table-responsive">
                  <table class="table table-striped mt-3">
                    <thead>
                      <tr>
                        <th scope="col">
                          <input type="checkbox" class="bulk-check" data-val="all">
                        </th>
                        @if ($settings->theme_version == 'theme_three' || $settings->theme_version == 'theme_four')
                          <th scope="col">{{ __('Image') }}</th>
                        @endif
                        <th scope="col">{{ __('Name') }}</th>
                        <th scope="col">{{ __('Status') }}</th>
                        <th scope="col">{{ __('Serial Number') }}</th>
                        <th scope="col">{{ __('Actions') }}</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($roomCategories as $roomCategory)
                        <tr>
                          <td>
                            <input type="checkbox" class="bulk-check" data-val="{{ $roomCategory->id }}">
                          </td>
                          @if ($settings->theme_version == 'theme_three' || $settings->theme_version == 'theme_four')
                            <td>
                              <img src="{{ asset('assets/img/room-category/' . $roomCategory->image) }}" alt=""
                                style="width: 50px">
                            </td>
                          @endif
                          <td>
                            {{ strlen($roomCategory->name) > 100 ? convertUtf8(substr($roomCategory->name, 0, 100)) . '...' : convertUtf8($roomCategory->name) }}
                          </td>
                          <td>
                            @if ($roomCategory->status == 1)
                              <h2 class="d-inline-block"><span class="badge badge-success">{{ __('Active') }}</span>
                              </h2>
                            @else
                              <h2 class="d-inline-block"><span class="badge badge-danger">{{ __('Deactive') }}</span>
                              </h2>
                            @endif
                          </td>
                          <td>{{ $roomCategory->serial_number }}</td>
                          <td>
                            <a class="btn btn-secondary btn-sm mr-1 mb-1 editBtn" href="#" data-toggle="modal"
                              data-target="#editModal" data-id="{{ $roomCategory->id }}"
                              data-name="{{ $roomCategory->name }}"
                              data-image="{{ asset('assets/img/room-category/' . $roomCategory->image) }}"
                              data-status="{{ $roomCategory->status }}"
                              data-serial_number="{{ $roomCategory->serial_number }}">
                              <span class="btn-label">
                                <i class="fas fa-edit"></i>
                              </span>
                            </a>

                            <form class="deleteForm d-inline-block "
                              action="{{ route('admin.rooms_management.delete_category') }}" method="post">
                              @csrf
                              <input type="hidden" name="category_id" value="{{ $roomCategory->id }}">

                              <button type="submit" class="btn btn-danger mb-1 btn-sm deleteBtn">
                                <span class="btn-label">
                                  <i class="fas fa-trash"></i>
                                </span>
                              </button>
                            </form>
                          </td>
                        </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              @endif
            </div>
          </div>
        </div>

        <div class="card-footer">
          <div class="row">
            <div class="d-inline-block mx-auto">
              {{ $roomCategories->appends(['language' => request()->input('language')])->links() }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  {{-- create modal --}}
  @include('backend.rooms.create_category')

  {{-- edit modal --}}
  @include('backend.rooms.edit_category')
@endsection
